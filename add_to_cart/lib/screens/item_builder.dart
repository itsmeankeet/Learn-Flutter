import 'package:flutter/material.dart';

class ReturnContainer extends StatelessWidget {
  const ReturnContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.grey.shade400, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Image.asset(
            "images/1.png",
            height: 400,
          ),
          const Text(
            "Air Jordan 1",
            style: TextStyle(
                fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Price \$400",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Clicked");
                  },
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 27,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
