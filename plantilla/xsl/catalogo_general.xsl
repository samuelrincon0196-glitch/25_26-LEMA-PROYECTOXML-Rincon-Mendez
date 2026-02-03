<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="catalogoXml" select="document('../xml/catalogo.xml')"/>


    <!-- Variable con el IVA (21%) -->
    <xsl:variable name="iva" select="0.21"/>

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <title>Catálogo de productos</title>
            <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		    <link rel="stylesheet" href="../assets/css/main.css" />
        </head>

        <body>
            <header id="header">
			<div class="inner">
				<a href="../index.html" class="logo">Nombre de la web</a>
				<nav id="nav">
					<a href="../index.html">Página Principal</a>
					<a href="#">Catálogo 1</a>
					<a href="catalogo_2.html">Catálogo 2</a>
					<a href="contacto.html">Contacto</a>
				</nav>
			</div>
		</header>
		<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

            <h1>Catálogo completo de productos</h1>

            <!-- Número total de productos -->
            <p>
                Total de productos:
                <strong>
                    <xsl:value-of select="count($catalogoXml//producto)"/>
                </strong>
            </p>

            <hr/>

            <!-- Lista de productos -->
            <div class="productos">

                <xsl:for-each select="$catalogoXml//producto">

                    <div class="producto">
                        <h2>
                            <xsl:value-of select="$catalogoXml/nombre"/>
                        </h2>

                        <!-- Imagen -->
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="$catalogoXml/imagen"/>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="$catalogoXml/nombre"/>
                            </xsl:attribute>
                        </img>

                        <!-- Precio -->
                        <p>
                            Precio base:
                            <strong>
                                <xsl:value-of select="$catalogoXml/precio"/> €
                            </strong>
                        </p>

                        <!-- Precio con IVA -->
                        <p>
                            Precio con IVA:
                            <strong>
                                <xsl:value-of
                                    select="format-number($catalogoXml/precio + ($catalogoXml/precio * $iva), '0.00')"/> €
                            </strong>
                        </p>

                        <!-- Descuento -->
                        <p>
                            Descuento aplicado:
                            <strong>
                                <xsl:value-of select="$catalogoXml/descuento"/> %
                            </strong>
                        </p>

                        <!-- Enlace externo -->
                        <p>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="url_ref"/>
                                </xsl:attribute>
                                Más información
                            </a>
                        </p>

                        <hr/>
                    </div>

                </xsl:for-each>

            </div>

        </body>
        </html>

    </xsl:template>

</xsl:stylesheet>
