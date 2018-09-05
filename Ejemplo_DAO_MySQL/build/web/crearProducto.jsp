<%-- 
    Document   : crearProducto
    Created on : 05-09-2018, 13:08:21
    Author     : maranda
--%>

<%@page import="model.Producto"%>
<%@page import="model.dao.DAO_Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Crear producto</h1>
        
        <form action="crearProducto.do" method="post">
            <input type=text name="nombre" placeholder="Nombre:" required>
            <input type=text name="precio" placeholder="Precio:" required>
            <input type=text name="stock" placeholder="Stock" required>
            <input type="submit" value="Registrar" name="btnRegistrar">
        </form>
        
        <div>
            <h3>Productos</h3>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Eliminar</th>
                        <th>Actualizar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        
                        <%
                           DAO_Producto dp=new DAO_Producto(); 
                           for (Producto pro: dp.read()) {%>
                                    <tr>
                                        <td><%=pro.getId()%></td>
                                        <td><%=pro.getNombre()%></td>
                                        <td>$ <%=+pro.getPrecio()%></td>
                                        <td><%=pro.getStock()%></td>
                                        <td>
                                            <form action="confirmacion.jsp" method="post">
                                                <input type="hidden" name="id" value="<%= pro.getId()%>"/>
                                                <input type="submit" value="Eliminar"/>
                                                
                                            </form>  
                                        </td>
                                        <td>
                                            <form action="crearProducto.jsp" method="post">
                                                <input type="hidden" name="id" value="<%= pro.getId()%>"/>
                                                <input type="submit" value="Actualizar"/>
                                                
                                            </form>  
                                        </td>
                                        
                                    </tr>
                               <%}
                        %>
                        
                    </tr>
                </tbody>
            </table>

            
            
        </div>
            
    </body>
</html>
