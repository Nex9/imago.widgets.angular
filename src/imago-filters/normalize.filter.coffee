class Titlecase extends Filter

  constructor: (imagoUtils) ->
    return (string) ->
      return false unless string
      return imagoUtils.titleCase(string)