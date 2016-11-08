## Voldemort пример

    String bootstrapUrl = "tcp://localhost:6666";
    StoreClientFactory factory = new SocketStoreClientFactory(new ClientConfig().setBootstrapUrls(bootstrapUrl));
    
    // create a client that executes operations on a single store
    StoreClient<String, String> client = factory.getStoreClient("my_store_name");
    ...
    
    // do some random pointless operations
    Versioned<String> value = client.get("some_key");
    value.setObject("some_value");
    client.put("some_key", value);
    ...

    value = client.get("some_key");
    System.out.println(String.valueOf(value.getValue()));
