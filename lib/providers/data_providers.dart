import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/doctor.dart';
import '../models/shop.dart';
import '../models/order.dart';
import '../models/dcr.dart';
import '../models/distributor.dart';

final doctorsProvider = Provider<List<Doctor>>((ref) {
  return const [
    Doctor(name: 'Dr. Pritam Kayal', specialization: 'Physiotherapy', prefixType: '2k25', description: '23'),
    Doctor(name: 'Dr sumit', specialization: 'mbbs', prefixType: 'icon'),
    Doctor(name: 'Dr Debasish Baidya', specialization: 'MBBS', prefixType: 'icon'),
    Doctor(name: 'Dr raj dutta', specialization: 'mbbs', prefixType: 'icon'),
  ];
});

final shopsProvider = Provider<List<Shop>>((ref) {
  return const [
    Shop(name: 'Naiyo24 Med Pharma', address: 'Baghajatin', phone: '8910941891', image: 'https://images.unsplash.com/photo-1576602976047-174e57a47881?auto=format&fit=crop&w=600&q=80'),
    Shop(name: 'Apollo Pharmacy', address: 'Salt Lake, Sec V', phone: '8001234567', image: 'https://images.unsplash.com/photo-1563213126-a4273aed2016?auto=format&fit=crop&w=600&q=80'),
  ];
});

final ordersProvider = Provider<List<Order>>((ref) {
  return const [
    Order(id: 'MR6289398298-ORD-20260319082511-B12FFD', status: 'APPROVED', shop: '-', dist: '-'),
    Order(id: 'MR6289398298-ORD-20260319115834-99C8AB', status: 'PENDING', shop: '-', dist: '-'),
    Order(id: 'MR6289398298-ORD-20260327092001-F1A395', status: 'PENDING', shop: '-', dist: '-'),
  ];
});

final dcrProvider = Provider<List<Dcr>>((ref) {
  return const [
    Dcr(doctorName: 'Dr Debasish Baidya', specialization: 'MBBS', date: 'Apr 30, 2026', time: '6:30 PM', place: 'Baghajatin, Kolkata', status: 'Completed'),
    Dcr(doctorName: 'Dr sumit', specialization: 'mbbs', date: 'Mar 28, 2026', time: '3:00 PM', place: 'kolkata', status: 'Completed'),
    Dcr(doctorName: 'Dr. Pritam Kayal', specialization: 'Physiotherapy', date: 'Mar 19, 2026', time: '5:30 PM', place: 'Baghajatin', status: 'Completed'),
  ];
});

final distributorsProvider = Provider<List<Distributor>>((ref) {
  return const [
    Distributor(
      id: 'DIST6283938298',
      name: 'Naiyo24 Dev Distributors',
      location: 'Kolkata',
      phone: '6289398298',
      image: 'https://picsum.photos/400/200',
    ),
  ];
});
