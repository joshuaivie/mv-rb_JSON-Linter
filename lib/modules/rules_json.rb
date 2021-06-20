module JSONRules
  NEWLINEERROR = ['Stylistic/Newline', 'Expected to see a new line at the end of file'].freeze
  EMPTYLINEERROR = ['Stylistic/Emptyline', 'There should not be an empty line'].freeze
  OPENPARENTHESIS = ['Syntax/BalancedParentheses', 'There is an open parenthesis that needs to be closed'].freeze
  CLOSEDPARENTHESIS = ['Syntax/BalancedParentheses', 'Expected to find a matching open parenthesis'].freeze
  IMPROPERINDENT = ['Stylistic/Indentation', 'Expected to see 2 spaces indetation pattern.'].freeze
  MALFORMEDFRACTION = ['Sytanx/Fraction', 'The fraction has not been properly formed'].freeze
  LEADINGZERO = ['Sytanx/LeadingZero', 'Leading zeros are not permitted in JSON numbers'].freeze
end
