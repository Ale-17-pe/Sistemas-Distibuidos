/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.apiweb.aresfitnes.resources;

import com.apiweb.aresfitnes.Model.Plan;
import com.apiweb.aresfitnes.dao.PlanDAO;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import java.util.*;

@Path("/planes")
public class PlanResource {
    
    private PlanDAO planDao = new PlanDAO();
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Plan> getPlanes(){
        try {
            System.out.println("🔍 Entrando al método getPlanes()");
            List<Plan> planes = planDao.obtenerTodos();
            System.out.println("📦 Planes obtenidos: " + planes.size());
            return planes;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
     
    }
    
}
