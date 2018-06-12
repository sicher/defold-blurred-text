# Blurred text example

The example uses the Rich Text library. It creates three sets of text:

1. TOP: Regular distance field font. Size 24.
2. MIDDLE: Same distance field font, but with a special material/shader that blurs it. It requires some outline added to the font to make room for the blur.
3. BOTTOM: Bitmap font (created with bmGlyph) manually blurred in photoshop. Extra padding added to the glyphs to make room for the blur.

## Notes

* The outline and padding affects the metrics of the text. This may be possible to fix with a negative padding parameter added to the Rich Text library.
* The special shader blur is expensive. For large text additional sample points need to be added. It currently samples a box of 49 pixels. If the text is small fewer sample points can be used.
* The manually blurred bitmap font is super cheap!

---