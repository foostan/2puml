class SampleParser
  prechigh
    nonassoc MINUS
    left '*' '/' '%'
    left '+' '-'
  preclow
 
  token var int
 
rule
  EXP : int
        { @stack << val[0].to_i }
      | var
        { @stack << [val[0], :var] }
      | '(' EXP ')'
      | '-' EXP = MINUS
        { @stack << [@stack.pop, :minus] }
      | EXP '*' EXP
        { @stack << [@stack.pop, @stack.pop, :mul] }
      | EXP '/' EXP
        { @stack << [@stack.pop, @stack.pop, :div] }
      | EXP '%' EXP
        { @stack << [@stack.pop, @stack.pop, :mod] }
      | EXP '+' EXP
        { @stack << [@stack.pop, @stack.pop, :add] }
      | EXP '-' EXP
        { @stack << [@stack.pop, @stack.pop, :sub] }
 
---- inner
def parse(tokens)
  @q           = tokens + [[false, '$']]
  @stack       = []
  do_parse
  return @stack
end
 
def next_token
  @q.shift
end
