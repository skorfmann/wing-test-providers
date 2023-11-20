bring cloud;
bring util;
bring "@cdktf/provider-docker" as docker;
bring "@cdktf/provider-null" as nullProvider;
bring "@cdktf/provider-random" as randomProvider;

class MyCustomProviderResourceOnce {
  new() {
    let once = (key: str): bool => {
      let root = std.Node.of(this).root;
      if root.node.tryGetContext(key) == nil {
        log("not found");
        return true;
      } else {
        log("found");
        root.node.setContext(key, true);
        return false;
      }
    };

    if once("a840f88f0dbd0df8e49ecf1bd620e780544ff62b55efa1837bb272b32c12b60e") {
      new docker.provider.DockerProvider();
      new nullProvider.provider.NullProvider();
      new randomProvider.provider.RandomProvider();
    }
  }
}

pub class MyCustomProviderResource {
  pub imageName: str;
  new() {
    new MyCustomProviderResourceOnce();

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