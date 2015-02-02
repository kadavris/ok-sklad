D:\Projects\Firebird-local\213\bin\gbak -C -V -USER sysdba -PAS masterkey -Y %1.restore.log %*
@exit

        -B(ACKUP_DATABASE)    backup database to file
        -BU(FFERS)            override page buffers default
        -C(REATE_DATABASE)    create database from backup file
        -CO(NVERT)            backup external files as tables
        -E(XPAND)             no data compression
        -FA(CTOR)             blocking factor
        -G(ARBAGE_COLLECT)    inhibit garbage collection
        -I(NACTIVE)           deactivate indexes during restore
        -IG(NORE)             ignore bad checksums
        -K(ILL)               restore without creating shadows
        -L(IMBO)              ignore transactions in limbo
        -M(ETA_DATA)          backup metadata only
        -MO(DE) <access>      "read_only" or "read_write" access
        -N(O_VALIDITY)        do not restore database validity conditions
        -NOD(BTRIGGERS)       do not run database triggers
        -NT                   Non-Transportable backup file format
        -O(NE_AT_A_TIME)      restore one table at a time
        -OL(D_DESCRIPTIONS)   save old style metadata descriptions
        -P(AGE_SIZE)          override default page size
        -PAS(SWORD)           Firebird password
        -R(ECREATE_DATABASE) [O(VERWRITE)] create (or replace if OVERWRITE used)
                                database from backup file
        -REP(LACE_DATABASE)   replace database from backup file
        -RO(LE)               Firebird SQL role
        -SE(RVICE)            use services manager
        -T(RANSPORTABLE)      transportable backup -- data in XDR format
        -USE_(ALL_SPACE)      do not reserve space for record versions
        -USER                 Firebird user name
        -V(ERIFY)             report each action taken
        -Y  <path>            redirect/suppress status message output
        -Z                    print version number