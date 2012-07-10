<%@ taglib prefix="s" uri="/struts-tags"%>

	<!-- Footer Grid: Start -->
	<div class="grid_24">

		<!-- Footer: Start -->
		<div id="footer">
		
			<p class="left">
				<a href="#">TT2011-B016</a> Simulador de Aplicaciones de Escritorio: Sesi&oacute;n de <s:property value="#session.tipoUsuario" />  &nbsp;&nbsp;&nbsp; <a href="http://www.escom.ipn.mx/" target="_blank">ESCOM</a>. 
			</p>
			
			<!-- Footer Icon Navigation: Start -->
			<ul class="right">
			
				<s:if test="#session.tipoUsuario == 'ADMIN'">
			
				</s:if>
			
			
			</ul>
			<!--Footer Icon Navigation: End -->
		
		</div>
		<!-- Footer: End -->
	
	</div>
	<!-- Footer Grid: End -->

</div>
<!-- End: Page Wrap ( Comienza en header.jsp[41] ) -->

	<!-- Bibliotecas de jQuery -->
	<script type="text/javascript" src="public/js/jquery.visualize-tooltip.js"></script>
	<script type="text/javascript" src="public/js/jquery-animate-css-rotate-scale.js"></script>
	<script type="text/javascript" src="public/js/jquery-ui-1.8.13.custom.min.js"></script>
	<script type="text/javascript" src="public/js/jquery.poshytip.min.js"></script>
	<script type="text/javascript" src="public/js/jquery.quicksand.js"></script>
	<script type="text/javascript" src="public/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="public/js/jquery.facebox.js"></script>
	<script type="text/javascript" src="public/js/jquery.uniform.min.js"></script>
	
	<!-- Personalización del sistema. -->
	<script type="text/javascript" src="public/js/custom.js"></script>
	<script type="text/javascript" src="public/js/acciones.js"></script>

</body>
</html>
