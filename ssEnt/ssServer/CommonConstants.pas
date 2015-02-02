// Client and Server common constants
unit CommonConstants;

interface

const
  // Client/Server Command() interface codes

  // Server-side codes
  cmdGetDir = 0; // get server-side directory contents to the client

  cmdSetSingleUserMode = 1;
    cmdSetSingleUserMode_res_NotOwner = 1; // singleuser mode is already set and we are not the owner
    cmdSetSingleUserMode_res_NotAlone = 2; // multiple users connected already

  cmdSetServerDebugLevel = 2; // param < 0 to query current dlevel
  cmdGetServerSysInfo = 3;

  cmdMaxCmdID = 3;

  //---------------------------------------------------------------------------
  // client-side command codes
  // cmdID constants for processCommand()

  // here is internal ones. Prefixed cltI
  cltIcmdWebCatRefresh = 0; // refreshes web category tree node by id. need treeID and nodeID (ignored for now-refreshes whole trees only)

implementation

end.

