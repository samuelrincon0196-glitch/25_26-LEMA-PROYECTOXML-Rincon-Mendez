<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="catalogoXml" select="document('../xml/catalogo.xml')" />


    <!-- Variable con el IVA (21%) -->
    <xsl:variable name="iva" select="0.21" />


    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">

        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Catálogo de productos</title>
                <meta name="viewport"
                    content="width=device-width, initial-scale=1, user-scalable=no" />
                <link rel="stylesheet" href="../assets/css/main.css" />
            </head>

            <body>
                <header id="header">
                    <div class="inner">
                        <a href="../index.html" class="logo">TechSolution</a>
                        <nav id="nav">
                            <a href="../index.html">Página Principal</a>
                            <a href="#">Catálogo 1</a>
                            <a href="PlantillaCatalogo4.xml">Catálogo 2</a>
                            <a href="../web/contacto.html">Contacto</a>
                        </nav>
                    </div>
                </header>
                <a href="#menu" class="navPanelToggle">
                    <span class="fa fa-bars"></span>
                </a>

                <h1 class="titulo_catalogo">Catálogo completo de productos</h1>

                <!-- Número total de productos -->
                <p class="titulo_catalogo"> Total de productos: <strong>
                        <xsl:value-of select="count($catalogoXml//producto)" />
                    </strong>
                </p>

                <hr />

                <!-- Lista de productos -->
                <div class="productos">

                    <xsl:for-each select="$catalogoXml//producto">

                        <div class="producto">
                            <h2>
                                <xsl:value-of select="nombre" />
                            </h2>

                            <!-- Imagen -->
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="imagen" />
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="nombre" />
                                </xsl:attribute>
                            </img>

                            <!-- Precio -->
                            <p> Precio base: <strong>
                                    <xsl:value-of select="precio" /> € </strong>
                            </p>

                            <!-- Precio con IVA -->
                            <p> Precio con IVA: <strong>
                                    <xsl:value-of
                                        select="format-number(precio + (precio * $iva), '0.00')" />
                                € </strong>
                            </p>

                            <!-- Descuento -->
                            <p> Descuento aplicado: <strong>
                                    <xsl:value-of select="format-number(descuento, 00)" /> % </strong>
                            </p>

                            <!-- Enlace externo -->
                            <p>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="url_ref" />
                                    </xsl:attribute>
                                    Más información 
                                </a>
                            </p>

                            <hr />
                        </div>

                    </xsl:for-each>

                </div>

                <!-- Footer -->
                <footer id="footer">
                    <div class="inner">
                        <div class="copyright"> 2026 Samuel Rincon - Carlos Méndez García <ul
                                class="icons">
                                <li>
                                    <a href="#" class="icon fa-twitter">
                                        <span class="label">Twitter</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="icon fa-facebook">
                                        <span class="label">Facebook</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="icon fa-instagram">
                                        <span class="label">Instagram</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="icon fa-github">
                                        <span class="label">Github</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="icon fa-dribbble">
                                        <span class="label">Dribbble</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="icon fa-tumblr">
                                        <span class="label">Tumblr</span>
                                    </a>
                                </li>
                            </ul>
                            Datos de la empresa o asosciación </div>
                    </div>
                </footer>

                <!-- Scripts -->
                <script src="../assets/js/jquery.min.js"></script>
                <script src="../assets/js/skel.min.js"></script>
                <script src="../assets/js/util.js"></script>
                <script src="../assets/js/main.js"></script>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>