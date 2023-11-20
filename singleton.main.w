bring cloud;
bring util;
bring "@cdktf/provider-docker" as docker;
bring "@cdktf/provider-null" as nullProvider;
bring "@cdktf/provider-random" as randomProvider;

class MyCustomProviderResourcInstance {
  pub static instance(scope: std.IResource): MyCustomProviderResourcInstance {
    let root = std.Node.of(scope).root;
    log("root ${root}");
    let id = "provider-instances";
    let exists: MyCustomProviderResourcInstance? = unsafeCast(root.node.tryFindChild(id));
    log("exists ${exists}");
    let rootAsResource: MyCustomProviderResourcInstance = unsafeCast(root);
    log("rootAsResource ${rootAsResource}");
    return exists ?? new MyCustomProviderResourcInstance() as id in rootAsResource;
  }

  new() {
    new docker.provider.DockerProvider();
    new nullProvider.provider.NullProvider();
    new randomProvider.provider.RandomProvider();
  }
}

pub class MyCustomProviderResource {
  pub imageName: str;
  new() {
    MyCustomProviderResourcInstance.instance(this);

    let randomString = new randomProvider.stringResource.StringResource(
      length: 10
    );

    let image = new docker.image.Image(
      name: "foo/bar",
    );

    let resource = new nullProvider.resource.Resource(triggers: { "changed": util.nanoid() });
    this.imageName = image.name;
  }
}


new MyCustomProviderResource();

test "foo" {
  log("hello");
}

test "bar" {
  log("hello");
}