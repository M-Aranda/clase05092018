<%-- 
    Document   : confirmacion
    Created on : 05-09-2018, 14:40:38
    Author     : maranda
--%>

<%@page import="model.Producto"%>
<%@page import="model.dao.DAO_Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String id=request.getParameter("id");
DAO_Producto dp= new DAO_Producto();
Producto pro=dp.findByID(id);


//puede ser asi tambin: Producto pro=new DAO_Producto().findByID(request.getParameter("id"));


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Confirmación</h1>
        
        
        <h2>Datos del producto</h2>

        <table border="0">
            <thead>
                <tr>
                    <td>Nombre: </td>
                    <td><%= pro.getNombre()%></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Precio: </td>
                    <td>$ <%= pro.getPrecio()%></td>
                </tr>
                <tr>
                    <td>Stock:</td>
                    <td><%= pro.getStock()%></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>


        
        
        
        
        <div>
            <br>
            ¿Desea eliminar a <%= pro.getNombre()%>?
            
            <form action="eliminarProducto.do" method="post">
                <input type="hidden" name="id" value="<%= pro.getId()%>">
                <input type="submit" value="Si">
                
            </form>
            
                <form action="crearProducto.jsp" method="post">
                <input type="submit" value="No">
                
            </form>
            <!--
            2 formularios si o no
            
            NO significa volver a crear producto
            SI significa ir al serlvet de eliminar, y enviar id como hidden  eliminarProducto.do
            
            -->
            
        </div>
    </body>
</html>
