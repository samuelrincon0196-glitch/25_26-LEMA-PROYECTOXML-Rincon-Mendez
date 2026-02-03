<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <!-- VARIABLE DE CONEXION CON EL XML-->
    <xsl:variable name="catalogoXml" select="document('../xml/catalogo.xml')" />


    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <!-- COMIENZO DEL XSL POR CATEGORIA-->
    <xsl:template match="/empresa">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Catálogo por Categorías</title>
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
                            <a href="PlantillaCatalogo3.xml">Catálogo 1</a>
                            <a href="#">Catálogo 2</a>
                            <a href="../web/contacto.html">Contacto</a>
                        </nav>
                    </div>
                </header>
                <a href="#menu" class="navPanelToggle">
                    <span class="fa fa-bars"></span>
                </a>

                <!-- COMIENZO DE LOS CATALOGOS-->
                <div>
                    <h1>Catálogo de productos</h1>
                    <p> Empresa: <strong>
                            <xsl:value-of select="$catalogoXml/empresa/@nombre" />
                        </strong>
                    </p>
                </div>

                <div class="productos">
                    <xsl:for-each select="$catalogoXml//categoria">
                        <section>
                            <header>
                                <h2> Categoría: <xsl:value-of select="@nombre" />
                                </h2>
                            </header>

                            <xsl:for-each select="producto">
                                <article>
                                    <header>
                                        <h3>
                                            <xsl:value-of select="nombre" />
                                        </h3>
                                    </header>

                                    <figure>
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="imagen" />
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="nombre" />
                                            </xsl:attribute>
                                        </img>
                                    </figure>

                                    <p> Precio: <strong>
                                            <xsl:value-of select="precio" />
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="precio/@moneda" />
                                        </strong>
                                    </p>

                                    <xsl:if test="descuento">
                                        <p> Descuento: <xsl:value-of select="descuento" />% </p>
                                    </xsl:if>

                                    <p>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="url_ref" />
                                            </xsl:attribute>
                                            Ver producto </a>
                                    </p>
                                </article>
                                <hr />
                            </xsl:for-each>
                        </section>
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