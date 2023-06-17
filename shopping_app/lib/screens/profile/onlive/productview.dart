import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFCFD0E5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/aqua.png",
                width: 80,
                height: 100,
              ),
             
                 Column(
                  children: [
                    
                     Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: const [
                            Text(
                              "Watch",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 18),
                            ),
                            
                            Text(
                              "200rs",
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    
                   
                       Expanded(
                         child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          width: 230,
                          child: Expanded(
                            child: const Text(
                                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.'),
                          ),
                                           ),
                       ),
                  
                  ],
                ),
              
            ],
          ),
        ],
      ),
    );
  }
}
