import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class CartItemShop extends StatelessWidget {
  final CartItem cartItem;

  const CartItemShop(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(cartItem.id),
        background: Container(
          color: Colors.purple[200],
          child: Icon(Icons.delete_sweep,
          color: Colors.white,
          size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(
            right: 20,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (_){
          Provider.of<Cart>(context, listen: false).removeItem(cartItem.productId);
        },
          child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(        
          padding: const EdgeInsets.all(8),        
          child: ListTile(          
            leading: Container(
              width: 50,            
              child: Image.network(
                cartItem.imageUrl,              
              ),
            ),
            title: Text(cartItem.title),
            subtitle: Text('Total: R\$${cartItem.price * cartItem.quantity}'),          
            trailing: Text('${cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}
