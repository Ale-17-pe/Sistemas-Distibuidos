package com.apiweb.aresfitnes;

import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
import java.util.*;
import org.glassfish.jersey.jackson.internal.jackson.jaxrs.json.JacksonJsonProvider;

/**
 * Configures Jakarta RESTful Web Services for the application.
 * @author Juneau
 */
@ApplicationPath("/api")
public class JakartaRestConfiguration extends Application {
    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> recursos = new HashSet<>();
        recursos.add(com.apiweb.aresfitnes.resources.PlanResource.class);
        recursos.add(JacksonJsonProvider.class); // ✅ Registramos el proveedor JSON
        return recursos;
    }
}


