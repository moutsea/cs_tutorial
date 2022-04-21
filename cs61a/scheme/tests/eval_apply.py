test = {
  'name': 'Understanding scheme.py',
  'points': 0,
  'suites': [
    {
      'cases': [
        {
          'answer': '78056c884b93b0e2f8a5d5d34652948c',
          'choices': [
            'A primitive expression or a list expression',
            'A pair or a list',
            'A special form or a call expression',
            'A primitive expression or a special form'
          ],
          'hidden': False,
          'locked': True,
          'question': 'A Scheme expression can be either...'
        },
        {
          'answer': 'f9007bdc473e42efc27b7ee858aff42e',
          'choices': [
            'env.lookup(expr)',
            'expr.first',
            'scheme_symbolp(expr)',
            'SPECIAL_FORMS[first](rest, env)'
          ],
          'hidden': False,
          'locked': True,
          'question': 'What expression in the body of scheme_eval finds the value of a name?'
        },
        {
          'answer': '8a3862b62f1e48f7772dc090bf991098',
          'choices': [
            r"""
            Check if the first element in the list is a symbol and
                        that that symbol is in the dictionary SPECIAL_FORMS
            """,
            'Check if the first element in the list is a symbol',
            'Check if the expression is in the dictionary SPECIAL_FORMS'
          ],
          'hidden': False,
          'locked': True,
          'question': r"""
          How do we know if a given list expression is a special
                      form?
          """
        },
        {
          'answer': '9257b8821d358e91004e461beaadc82b',
          'choices': [
            'SchemeError("malformed list: (1)")',
            'SchemeError("1 is not callable")',
            'AssertionError',
            'SchemeError("unknown identifier: 1")'
          ],
          'hidden': False,
          'locked': True,
          'question': 'What exception should be raised for the expression (1)?'
        }
      ],
      'scored': False,
      'type': 'concept'
    }
  ]
}
