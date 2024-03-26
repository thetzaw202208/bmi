import 'package:flutter_dotenv/flutter_dotenv.dart';

///Base URL
String baseURL = dotenv.get("baseURL", fallback: null);

///Endpoint
const String registerEndpoint = "sellers/register";
const String loginEndpoint = "sellers/login";
const String getSellerTypeEndpoint = "sellers/type";
const String getProductTypeEndpoint = "sellers/product/type";
const String getProductCatEndpoint = "sellers/product/categories";
const String sellOrderEndpoint = "sellers/order/product";
const String getMeasurementEndpoint = "sellers/measurements";

///Authorization token
String authorizationToken =dotenv.get("API_TOKEN", fallback: null);

const String contentType = 'application/json';