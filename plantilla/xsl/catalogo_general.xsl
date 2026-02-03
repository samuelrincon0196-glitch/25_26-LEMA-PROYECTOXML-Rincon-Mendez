<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Variable con el IVA (21%) -->
    <xsl:variable name="iva" select="0.21"/>

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <title>Catálogo de productos</title>
        </head>

        <body>

            <h1>Catálogo completo de productos</h1>

            <!-- Número total de productos -->
            <p>
                Total de productos:
                <strong>
                    <xsl:value-of select="count(//producto)"/>
                </strong>
            </p>

            <hr/>

            <!-- Lista de productos -->
            <div class="productos">

                <xsl:for-each select="//producto">

                    <div class="producto">
                        <h2>
                            <xsl:value-of select="nombre"/>
                        </h2>

                        <!-- Imagen -->
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="imagen"/>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="nombre"/>
                            </xsl:attribute>
                        </img>

                        <!-- Precio -->
                        <p>
                            Precio base:
                            <strong>
                                <xsl:value-of select="precio"/> €
                            </strong>
                        </p>

                        <!-- Precio con IVA -->
                        <p>
                            Precio con IVA:
                            <strong>
                                <xsl:value-of
                                    select="format-number(precio + (precio * $iva), '0.00')"/> €
                            </strong>
                        </p>

                        <!-- Descuento -->
                        <p>
                            Descuento aplicado:
                            <strong>
                                <xsl:value-of select="descuento"/> %
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
