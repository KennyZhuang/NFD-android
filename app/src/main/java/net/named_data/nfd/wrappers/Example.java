package net.named_data.nfd.wrappers;

/**
 * Created by cawka on 1/27/15.
 */
public class Example
{
  static {
    System.loadLibrary("nfd-wrapper");
  }

  public native static void main();
}
