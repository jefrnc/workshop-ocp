package org.acme.getting.started;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@Path("/hello")
public class HelloResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "hello";
    }

    /*
    @ConfigProperty(name = "greeting.message") 
    String message;

    @ConfigProperty(name = "greeting.name", defaultValue="!") 
    String name;*/

}