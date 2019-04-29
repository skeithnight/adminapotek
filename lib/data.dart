var appName = "Smart Apotek";
var baseURL = "http://35.188.204.202:8081";
// Authentication
// Apotek
var urlApotekRegister = "$baseURL/apotek/register";
var urlApotekLogin = "$baseURL/apotek/login";
var urlApotekCheckSession = "$baseURL/apotek/check-session";

var urlApotek = "$baseURL/apotek";
// Customer
var urlCustomerRegister = "$baseURL/customer/register";
var urlCustomerLogin = "$baseURL/customer/login";
var urlCustomerCheckSession = "$baseURL/customer/check-session";
List<String> listEnabled = ["True", "False"];


// Product
var urlObat = "$baseURL/produk";

// Order
var urlOrder = "$baseURL/transaksi";