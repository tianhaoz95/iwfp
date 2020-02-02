export default {
  typescript: true,
  // hashRouter: true,
  // base: '/iwfp-home',
  menu: [
    'Home',
    'Design',
    {
      name: 'Developer',
      menu: [
        'App',
        'Server',
        'Continuous Integration',
        'Documentation'
      ]
    },
    {
      name: 'Contribute',
      menu: [
        'As User',
        'As Developer',
        'As Sponsor'
      ]
    }
  ],
  ignore: [
    'README.md'
  ],
  title: "I Want 5% Project",
  description: "A utility app to help credit card users maximize cashback rewards."
}
