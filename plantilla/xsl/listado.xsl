<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="productos" select="//producto"/>

    <xsl:template match="/">
        <div class="lista-completa">
            <h2>Catálogo General</h2>
            <p>Total productos: <xsl:value-of select="count($productos)"/></p> <ul>
                <xsl:for-each select="$productos">
                    <li>
                        <strong><xsl:value-of select="nombre"/></strong><br/>
                        Precio: <xsl:value-of select="precio"/> € | 
                        Con IVA: <xsl:value-of select="precio * 1.21"/> €
                        <br/>
                        <img src="{imagen}" width="100"/> <br/>
                        <a href="{url_ref}">Ver más detalles</a> <xsl:if test="descuento > 0">
                            <span style="color:red;"> ¡Oferta: <xsl:value-of select="descuento"/>% dto!</span>
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
</xsl:stylesheet>