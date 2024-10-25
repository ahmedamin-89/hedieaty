// lib/widgets/gift_card.dart
import 'package:flutter/material.dart';

class GiftCard extends StatelessWidget {
  final String giftName;
  final String category;
  final String status; // "Available", "Pledged", "Purchased"
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const GiftCard({
    super.key,
    required this.giftName,
    required this.category,
    required this.status,
    required this.onTap,
    this.onEdit,
    this.onDelete,
  });

  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'pledged':
        return Colors.green;
      case 'purchased':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData get statusIcon {
    switch (status.toLowerCase()) {
      case 'pledged':
        return Icons.card_giftcard;
      case 'purchased':
        return Icons.check_circle;
      default:
        return Icons.card_giftcard;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEditable = status.toLowerCase() == 'available';

    return Card(
      child: ListTile(
        leading: Icon(
          statusIcon,
          color: statusColor,
          size: 30,
        ),
        title: Text(giftName),
        subtitle: Text('Category: $category'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isEditable)
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: onEdit,
                tooltip: 'Edit Gift',
              ),
            if (isEditable)
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
                tooltip: 'Delete Gift',
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
