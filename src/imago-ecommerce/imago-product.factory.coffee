class imagoProduct extends Factory

  constructor: (imagoCart, fulfillmentsCenter) ->

    return class ProductInstance

      constructor: (@variants, options) ->
        return unless @variants and options

        for key of options
          @[key] = options[key]
        unless @optionsWhitelist
          return console.log 'no optionsWhitelist set.'
        @lowStock or= 3
        @getOptions()

      getOptions: ->
        @options = {}

        if @variants.length is 1
          for variant in @variants
            variant.stock = Number(variant.fields?.stock?.value?[fulfillmentsCenter.selected._id])
            variant.presale = variant.fields?.presale?.value
            variant.lowstock = if variant.stock <= @lowStock and variant.stock then true else false

          @selected = _.head @variants

        else
          for variant in @variants
            continue unless angular.isDefined(variant.fields.price?.value?[imagoCart.currency])
            for item in @optionsWhitelist
              continue unless variant.fields[item.name]?.value
              obj = {}
              for key of item
                obj[key] = variant.fields?[item[key]]?.value
              obj.normname = _.kebabCase(obj.name)
              @options[item.name] or= []
              @options[item.name].push obj

            # save stock and low stock
            variant.stock = Number(variant.fields?.stock?.value?[fulfillmentsCenter.selected._id])
            variant.presale = variant.fields?.presale?.value
            variant.lowstock = if variant.stock <= @lowStock and variant.stock then true else false

          if @options.size?.length > 1
            order = ['xxs', 'xs', 's', 'm', 'l', 'xl', 'xxl']
            @options.size.sort (a, b) -> order.indexOf(a.normname) - order.indexOf(b.normname)

          # uniqify options
          for key of @options
            @options[key] = _.uniqBy @options[key], 'name'
            if @options[key]?.length is 1
              @[key] = _.head(@options[key]).name

          @selectVariant()

      setOption: (attr, value) ->
        @[attr] = value
        @selectVariant()

      findVariant: (field, value) ->
        opts = []

        for opt in @optionsWhitelist
          obj =
            name: opt.name
          obj.value = if obj.name is field then value else @[opt.name]
          return true unless obj.value
          opts.push obj

        item = _.find @variants, (variant) ->
          valid = true
          for opt in opts
            valid = false if _.kebabCase(variant.fields?[opt.name]?.value) isnt _.kebabCase(opt.value)
          return true if valid

        if item?.stock or item?.presale
          return true
        else
          return false

      selectVariant: ->
        keys = {}
        valid = true
        for key of @options
          valid = false unless @[key]
          keys[key] = @[key]

        return unless valid

        variant = _.find @variants, (item) =>
          valid = true
          for key of keys
            norm = _.kebabCase(item.fields?[key]?.value)
            return false if norm isnt _.kebabCase(@[key])

          return valid

        if !variant
          @selected = 0
          return

        variant.price = variant.fields?.price?.value
        variant.discountedPrice = variant.fields?.discountedPrice?.value
        @selected = variant

