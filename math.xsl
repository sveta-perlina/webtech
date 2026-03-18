<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:m="http://www.w3.org/1998/Math/MathML"
  exclude-result-prefixes="m">

  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <!-- Entry point: wrap everything into MathML <math> -->
  <xsl:template match="/">
    <m:math display="block">
      <xsl:apply-templates/>
    </m:math>
  </xsl:template>

  <!-- Generic containers -->
  <xsl:template match="строка">
    <m:mrow>
      <xsl:apply-templates/>
    </m:mrow>
  </xsl:template>

  <xsl:template match="операнд">
    <m:mi><xsl:value-of select="."/></m:mi>
  </xsl:template>

  <xsl:template match="оператор">
    <m:mo><xsl:value-of select="."/></m:mo>
  </xsl:template>

  <xsl:template match="число">
    <m:mn><xsl:value-of select="."/></m:mn>
  </xsl:template>

  <!-- Structures -->
  <xsl:template match="дробь">
    <m:mfrac>
      <xsl:apply-templates select="строка[1]"/>
      <xsl:apply-templates select="строка[2]"/>
    </m:mfrac>
  </xsl:template>

  <xsl:template match="корень">
    <m:msqrt>
      <xsl:apply-templates/>
    </m:msqrt>
  </xsl:template>

  <!-- Subscript: <низ> has two rows: base, subscript -->
  <xsl:template match="низ">
    <m:msub>
      <xsl:apply-templates select="строка[1]"/>
      <xsl:apply-templates select="строка[2]"/>
    </m:msub>
  </xsl:template>

  <!-- Superscript: <верх> has two rows: base, superscript -->
  <xsl:template match="верх">
    <m:msup>
      <xsl:apply-templates select="строка[1]"/>
      <xsl:apply-templates select="строка[2]"/>
    </m:msup>
  </xsl:template>

  <!-- Under + over (sum with lower/upper limits) -->
  <xsl:template match="низверх">
    <m:munderover>
      <xsl:apply-templates select="строка[1]"/>
      <xsl:apply-templates select="строка[2]"/>
      <xsl:apply-templates select="строка[3]"/>
    </m:munderover>
  </xsl:template>

</xsl:stylesheet>
