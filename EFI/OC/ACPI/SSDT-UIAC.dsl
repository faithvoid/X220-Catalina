DefinitionBlock ("", "SSDT", 2, "ACDT", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            // EH01 (8086_1c26)
            "EH01", Package()
            {
                "port-count", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "PR11", Package()
                      {
                          "name", Buffer() { "PR11" },
                          "UsbConnector", 255,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                      },
                      "PR12", Package()
                      {
                          "name", Buffer() { "PR12" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                      },
                      "PR13", Package()
                      {
                          "name", Buffer() { "PR13" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x03, 0x00, 0x00, 0x00 },
                      },
                      "PR14", Package()
                      {
                          "name", Buffer() { "PR14" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                      },
                      "PR15", Package()
                      {
                          "name", Buffer() { "PR15" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x05, 0x00, 0x00, 0x00 },
                      },
                      "PR16", Package()
                      {
                          "name", Buffer() { "PR16" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                      },
                      "PR17", Package()
                      {
                          "name", Buffer() { "PR17" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x07, 0x00, 0x00, 0x00 },
                      },
                      "PR18", Package()
                      {
                          "name", Buffer() { "PR18" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                      },
                },
            },
            // EH02 (8086_1c2d)
            "EH02", Package()
            {
                "port-count", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "PR21", Package()
                      {
                          "name", Buffer() { "PR21" },
                          "UsbConnector", 255,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                      },
                      "PR22", Package()
                      {
                          "name", Buffer() { "PR22" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                      },
                      "PR23", Package()
                      {
                          "name", Buffer() { "PR23" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x03, 0x00, 0x00, 0x00 },
                      },
                      "PR24", Package()
                      {
                          "name", Buffer() { "PR24" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                      },
                      "PR25", Package()
                      {
                          "name", Buffer() { "PR25" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x05, 0x00, 0x00, 0x00 },
                      },
                      "PR26", Package()
                      {
                          "name", Buffer() { "PR26" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                      },
                },
            },
            // EH02 (8086_1c2d)
            "HUB2", Package()
            {
                "port-count", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "HP21", Package()
                      {
                          "name", Buffer() { "HP21" },
                          "portType", 0,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                      },
                      "HP22", Package()
                      {
                          "name", Buffer() { "HP22" },
                          "portType", 0,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                      },
                      "HP23", Package()
                      {
                          "name", Buffer() { "HP23" },
                          "portType", 0,
                          "port", Buffer() { 0x03, 0x00, 0x00, 0x00 },
                      },
                      "HP24", Package()
                      {
                          "name", Buffer() { "HP24" },
                          "portType", 0,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                      },
                      "HP25", Package()
                      {
                          "name", Buffer() { "HP25" },
                          "portType", 0,
                          "port", Buffer() { 0x05, 0x00, 0x00, 0x00 },
                      },
                      "HP26", Package()
                      {
                          "name", Buffer() { "HP26" },
                          "portType", 0,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                      },
                      "HP27", Package()
                      {
                          "name", Buffer() { "HP27" },
                          "portType", 0,
                          "port", Buffer() { 0x07, 0x00, 0x00, 0x00 },
                      },
                      "HP28", Package()
                      {
                          "name", Buffer() { "HP28" },
                          "portType", 0,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                      },
                },
            },
            // EH01 (8086_1c26)
            "HUB1", Package()
            {
                "port-count", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "HP11", Package()
                      {
                          "name", Buffer() { "HP11" },
                          "portType", 0,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                      },
                      "HP12", Package()
                      {
                          "name", Buffer() { "HP12" },
                          "portType", 0,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                      },
                      "HP13", Package()
                      {
                          "name", Buffer() { "HP13" },
                          "portType", 0,
                          "port", Buffer() { 0x03, 0x00, 0x00, 0x00 },
                      },
                      "HP14", Package()
                      {
                          "name", Buffer() { "HP14" },
                          "portType", 0,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                      },
                      "HP16", Package()
                      {
                          "name", Buffer() { "HP16" },
                          "portType", 0,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                      },
                      "HP17", Package()
                      {
                          "name", Buffer() { "HP17" },
                          "portType", 0,
                          "port", Buffer() { 0x07, 0x00, 0x00, 0x00 },
                      },
                      "HP18", Package()
                      {
                          "name", Buffer() { "HP18" },
                          "portType", 0,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                      },
                },
            },
        })
    }
}
