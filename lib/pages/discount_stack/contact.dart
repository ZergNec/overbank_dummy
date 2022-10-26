class Contact {
  const Contact(
    this.name,
    this.role,
    this.address,
    this.phone,
    this.email,
    this.website,
    this.number,
  );

  final String name;
  final String role;
  final String address;
  final String phone;
  final String email;
  final String website;
  final String number;

  static const contacts = [
    Contact('Card 01', 'Category 01', 'Address for card 01', '123-575-0381',
        'card01@email.com', 'card01.com', '01'),
    Contact(
      'Card 02',
      'Category 02',
      'Address for card 02',
      '123-575-0381',
      'card02@email.com',
      'card02.com',
      '02',
    ),
    Contact('Card 02', 'Category 02', 'Address for card 02', '123-575-0381',
        'card02@email.com', 'card02.com', '03'),
    Contact('Card 03', 'Category 03', 'Address for card 03', '123-575-0381',
        'card03@email.com', 'card03.com', '04'),
    Contact('Card 04', 'Category 04', 'Address for card 04', '123-575-0381',
        'card04@email.com', 'card04.com', '04'),
    Contact('Card 05', 'Category 05', 'Address for card 05', '123-575-0381',
        'card05@email.com', 'card05.com', '06'),
    Contact(
      'Card 06',
      'Category 06',
      'Address for card 06',
      '123-575-0381',
      'card06@email.com',
      'card06.com',
      '07',
    ),
    Contact('Card 07', 'Category 07', 'Address for card 07', '123-575-0381',
        'card07@email.com', 'card07.com', '08'),
    Contact('Card 08', 'Category 08', 'Address for card 08', '123-575-0381',
        'card08@email.com', 'card08.com', '09'),
    Contact('Card 09', 'Category 09', 'Address for card 09', '123-575-0381',
        'card09@email.com', 'card09.com', '10'),
    Contact('Card 10', 'Category 10', 'Address for card 10', '123-575-0381',
        'card10@email.com', 'card10.com', '11'),
    Contact('Card 11', 'Category 11', 'Address for card 11', '123-575-0381',
        'card11@email.com', 'card11.com', '12'),
    Contact('Card 12', 'Category 12', 'Address for card 12', '123-575-0381',
        'card12@email.com', 'card12.com', '13'),
    Contact('Card 13', 'Category 13', 'Address for card 13', '123-575-0381',
        'card13@email.com', 'card13.com', '14'),
    Contact('Card 14', 'Category 14', 'Address for card 14', '123-575-0381',
        'card14@email.com', 'card14.com', '15'),
    Contact('Card 15', 'Category 15', 'Address for card 15', '123-575-0381',
        'card15@email.com', 'card15.com', '16'),
    Contact('Card 16', 'Category 16', 'Address for card 16', '123-575-0381',
        'card16@email.com', 'card16.com', '17'),
    Contact('Card 17', 'Category 17', 'Address for card 17', '123-575-0381',
        'card17@email.com', 'card17.com', '18'),
    Contact('Card 18', 'Category 18', 'Address for card 18', '123-575-0381',
        'card18@email.com', 'card18.com', '05'),
  ];
}
