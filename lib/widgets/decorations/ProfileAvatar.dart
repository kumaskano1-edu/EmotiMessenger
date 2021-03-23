import 'package:flutter/material.dart';
import 'package:messenger/state/User.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileAvatarWidget extends StatefulWidget {
  @override
  _ProfileAvatarWidgetState createState() => _ProfileAvatarWidgetState();
}

class _ProfileAvatarWidgetState extends State<ProfileAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model )
    {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: CircleAvatar(
          backgroundColor: Colors.brown.shade800,
          child: model.imageUrl != null ? Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        model.imageUrl.toString())
                )),
          ) : Text(model.name[0].toUpperCase())
        ),
      );
    });
  }
}
