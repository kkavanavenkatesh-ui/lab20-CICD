package com.devops.lab;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class CalculatorTest {
Calculator calculator = new Calculator();
@Test
void testMultiply() {
assertEquals(20, calculator.multiply(4,5));
}
}