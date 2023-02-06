## Import để sử dụng các component trong theme M3
import 'package:theme/material3/m3_theme_lib.dart';

#### Text style ####
# Card header => context.cardHeader
 Ex: Text("Card header", style: context.cardHeader)
# Card title => context.cardTitle
 Ex: Text("Card title", style: context.cardTitle)
# Body text => default text
 Ex: Text("Body text"),
# Highlight Text => context.labelLarge
 Ex: Text("Highlight Text", style: context.labelLarge)
# Price Text => context.priceText
  + Small price => textStyle.priceSmall
  + Medium price => textStyle.priceMedium
  + Large price => textStyle.priceLarge
  Ex: Text("123.000.VND", style: context.priceText.priceMedium)
# Color text
  + Notice, error color => textStyle.notice
  + Primary color => textStyle.primary
  + On primary color => textStyle.onPrimary
  + Normal color (black) => textStyle.normal
  + body text color (gray) => textStyle.body
  + Green, focus color => textStyle.green
  + Red color => textStyle.red
  + Orange => textStyle.orange
  Ex: Text("Color text", style: context.labelLarge.notice)


#### Card ####
Các thuộc tính mặc định như shape, color, margin không truyền vào
- Nếu Card ko có bo góc thì dùng HaloShape.zeroBorderShape
  Ex: shape: HaloShape.zeroBorderShape

### Custom colors
Sử dụng màu custom như orange, green, yellow(hạn chế dùng màu vàng này, sẽ bỏ trong tương lai)
 Ex: context.orangeColor, context.orangeContainer
    context.greenColor, context.greenContainer
