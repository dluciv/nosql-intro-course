## Пример Voldemort (Java)

    String bootstrapUrl = "tcp://localhost:6666";
    StoreClientFactory factory = new SocketStoreClientFactory(
        new ClientConfig().setBootstrapUrls(bootstrapUrl)
    );
    StoreClient<String, String> client =
        factory.getStoreClient("my_store_name");

<!-- -->

    // do some random pointless operations
    Versioned<String> value = client.get("some_key");
    value.setObject("some_value");
    client.put("some_key", value);
