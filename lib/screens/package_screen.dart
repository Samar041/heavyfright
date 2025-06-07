import 'package:flutter/material.dart';

class PackageFormScreen extends StatefulWidget {
  const PackageFormScreen({Key? key}) : super(key: key);

  @override
  State<PackageFormScreen> createState() => _PackageFormScreenState();
}

class _PackageFormScreenState extends State<PackageFormScreen> {
  int selectedWeightIndex = 1; 
  int selectedPackIndex = 1; 

  final pickupController =
      TextEditingController(text: 'Gabes 6011 , Cite zouhour');
  final dropOffController =
      TextEditingController(text: 'Tunis 4021 , Cite olympique');

  final weightOptions = [
    {'label': '< 5 kg', 'desc': 'Small', 'image': 'assets/small.png'},
    {'label': '5 - 20 kg', 'desc': 'Medium', 'image': 'assets/medium.png'},
    {'label': '> 20 kg', 'desc': 'Large', 'image': 'assets/large.png'},
  ];

  final packOptions = [
    {
      'label': 'Standard',
      'desc': '2-3 Days shipping',
      'price': '23 DT',
    },
    {
      'label': 'Fast',
      'desc': '1 Day shipping',
      'price': '32 DT',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: const Text(
          'New Delivery',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'HeavyFreight',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAddressCard(),
                const SizedBox(height: 20),
                const Text(
                  'Package Size',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.white, ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    final selected = selectedWeightIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedWeightIndex = index);
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selected ?const Color.fromARGB(255, 255, 102, 0): Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            if (selected)
                              Positioned(
                                top: -10,
                                right: -10,
                                child: Icon(Icons.check_circle,
                                    color:const Color.fromARGB(255, 255, 102, 0), size: 20),
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  weightOptions[index]['label']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),
                                  textAlign: TextAlign.center,
                                  
                                  
                                ),
                                const SizedBox(height: 8),
                                Image.asset(
                                  weightOptions[index]['image']!,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  weightOptions[index]['desc']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Delivery Packs',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,  color: Colors.white, ),
                ),
                const SizedBox(height: 12),
                Column(
                  children: List.generate(2, (index) {
                    final selected = selectedPackIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedPackIndex = index);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: selected ? const Color.fromARGB(255, 255, 102, 0): Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  packOptions[index]['label']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  packOptions[index]['desc']!,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Text(
                              packOptions[index]['price']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: selected ? const Color.fromARGB(255, 255, 102, 0) : const Color.fromARGB(255, 26, 173, 21),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                    
                      style: ElevatedButton.styleFrom(
                        
                        backgroundColor: const Color.fromARGB(255, 255, 102, 0),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/tracking');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                         
                        
                          Text('Continue', style: TextStyle(fontSize: 18 ,  color: Colors.white, )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard() {
    return Container(
      
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          _buildAddressRow('From', pickupController.text, Colors.green),
          const SizedBox(height: 10),
          _buildAddressRow('To', dropOffController.text, const Color.fromARGB(255, 255, 102, 0)),
        ],
      ),
    );
  }

  Widget _buildAddressRow(String label, String address, Color dotColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(Icons.circle, color: dotColor, size: 12),
            const SizedBox(height: 20),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Color.fromARGB(255, 252, 249, 249))),
              Text(address, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const Icon(Icons.map_outlined),
      ],
    );
  }
}
