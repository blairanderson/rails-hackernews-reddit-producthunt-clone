ActiveApi::Engine.config.route_config = [
  {
    resources: 'items',
    do: [
      {
        resources: 'comments'
      }
    ]
  },
  {
    resources: 'users',
    serializer: 'human'
  }
]

ActiveApi::Engine.config.documentation = {

}
