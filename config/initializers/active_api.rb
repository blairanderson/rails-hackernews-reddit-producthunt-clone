ActiveApi::Engine.config.route_config = [
  {
    resources: 'items',
    do: [
      {
        resources: 'item_comments',
      }
    ]
  },
  {
    resources: 'users',
    serializer: 'human'
  }
]

ActiveApi::Engine.config.documentation = {
  title: "Rails HackerNews-Reddit-ProductHunt Clone.",
  description: "StarterKit for a social news/product site.",
  termsOfServiceUrl: "http://github.com/blairanderson/active_api",
  # contact: "issues@someawesomeapi.com",
  license: "MIT",
  licenseUrl: "http://github.com/blairanderson/active_api/tree/master/LICENSE.md"
}

ActiveApi::Engine.config.authorization = {
  model: "User",
  token: "token"
}
