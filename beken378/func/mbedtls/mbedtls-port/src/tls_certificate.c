/*
 *  Copyright (C) 2006-2015, ARM Limited, All Rights Reserved
 *  SPDX-License-Identifier: Apache-2.0
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may
 *  not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 *  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *  This file is part of mbed TLS (https://tls.mbed.org)
 */

#include "certs.h"

#if 0
#define ENTRUST_ROOT_CA                                                 \
"-----BEGIN CERTIFICATE-----\r\n"                                       \
"MIIEPjCCAyagAwIBAgIESlOMKDANBgkqhkiG9w0BAQsFADCBvjELMAkGA1UEBhMC\r\n"  \
"VVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xKDAmBgNVBAsTH1NlZSB3d3cuZW50\r\n"  \
"cnVzdC5uZXQvbGVnYWwtdGVybXMxOTA3BgNVBAsTMChjKSAyMDA5IEVudHJ1c3Qs\r\n"  \
"IEluYy4gLSBmb3IgYXV0aG9yaXplZCB1c2Ugb25seTEyMDAGA1UEAxMpRW50cnVz\r\n"  \
"dCBSb290IENlcnRpZmljYXRpb24gQXV0aG9yaXR5IC0gRzIwHhcNMDkwNzA3MTcy\r\n"  \
"NTU0WhcNMzAxMjA3MTc1NTU0WjCBvjELMAkGA1UEBhMCVVMxFjAUBgNVBAoTDUVu\r\n"  \
"dHJ1c3QsIEluYy4xKDAmBgNVBAsTH1NlZSB3d3cuZW50cnVzdC5uZXQvbGVnYWwt\r\n"  \
"dGVybXMxOTA3BgNVBAsTMChjKSAyMDA5IEVudHJ1c3QsIEluYy4gLSBmb3IgYXV0\r\n"  \
"aG9yaXplZCB1c2Ugb25seTEyMDAGA1UEAxMpRW50cnVzdCBSb290IENlcnRpZmlj\r\n"  \
"YXRpb24gQXV0aG9yaXR5IC0gRzIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK\r\n"  \
"AoIBAQC6hLZy254Ma+KZ6TABp3bqMriVQRrJ2mFOWHLP/vaCeb9zYQYKpSfYs1/T\r\n"  \
"RU4cctZOMvJyig/3gxnQaoCAAEUesMfnmr8SVycco2gvCoe9amsOXmXzHHfV1IWN\r\n"  \
"cCG0szLni6LVhjkCsbjSR87kyUnEO6fe+1R9V77w6G7CebI6C1XiUJgWMhNcL3hW\r\n"  \
"wcKUs/Ja5CeanyTXxuzQmyWC48zCxEXFjJd6BmsqEZ+pCm5IO2/b1BEZQvePB7/1\r\n"  \
"U1+cPvQXLOZprE4yTGJ36rfo5bs0vBmLrpxR57d+tVOxMyLlbc9wPBr64ptntoP0\r\n"  \
"jaWvYkxN4FisZDQSA/i2jZRjJKRxAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAP\r\n"  \
"BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRqciZ60B7vfec7aVHUbI2fkBJmqzAN\r\n"  \
"BgkqhkiG9w0BAQsFAAOCAQEAeZ8dlsa2eT8ijYfThwMEYGprmi5ZiXMRrEPR9RP/\r\n"  \
"jTkrwPK9T3CMqS/qF8QLVJ7UG5aYMzyorWKiAHarWWluBh1+xLlEjZivEtRh2woZ\r\n"  \
"Rkfz6/djwUAFQKXSt/S1mja/qYh2iARVBCuch38aNzx+LaUa2NSJXsq9rD1s2G2v\r\n"  \
"1fN2D807iDginWyTmsQ9v4IbZT+mD12q/OWyFcq1rca8PdCE6OoGcrBNOTJ4vz4R\r\n"  \
"nAuknZoh8/CbCzB428Hch0P+vGOaysXCHMnHjf87ElgI5rY97HosTvuDls4MPGmH\r\n"  \
"VHOkc8KT/1EQrBVUAdj8BbGJoX90g5pJ19xOe4pIb4tF9g==\r\n"                  \
"-----END CERTIFICATE-----\r\n"


const char mbedtls_root_certificate[] = 
	ENTRUST_ROOT_CA
	;
#elif 0
/////www.baidu.com
#define GLOBALSIGN_ROOT_CA                                              \
"-----BEGIN CERTIFICATE-----\r\n"                                       \
"MIIDdTCCAl2gAwIBAgILBAAAAAABFUtaw5QwDQYJKoZIhvcNAQEFBQAwVzELMAkG\r\n"  \
"A1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExEDAOBgNVBAsTB1Jv\r\n"  \
"b3QgQ0ExGzAZBgNVBAMTEkdsb2JhbFNpZ24gUm9vdCBDQTAeFw05ODA5MDExMjAw\r\n"  \
"MDBaFw0yODAxMjgxMjAwMDBaMFcxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9i\r\n"  \
"YWxTaWduIG52LXNhMRAwDgYDVQQLEwdSb290IENBMRswGQYDVQQDExJHbG9iYWxT\r\n"  \
"aWduIFJvb3QgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDaDuaZ\r\n"  \
"jc6j40+Kfvvxi4Mla+pIH/EqsLmVEQS98GPR4mdmzxzdzxtIK+6NiY6arymAZavp\r\n"  \
"xy0Sy6scTHAHoT0KMM0VjU/43dSMUBUc71DuxC73/OlS8pF94G3VNTCOXkNz8kHp\r\n"  \
"1Wrjsok6Vjk4bwY8iGlbKk3Fp1S4bInMm/k8yuX9ifUSPJJ4ltbcdG6TRGHRjcdG\r\n"  \
"snUOhugZitVtbNV4FpWi6cgKOOvyJBNPc1STE4U6G7weNLWLBYy5d4ux2x8gkasJ\r\n"  \
"U26Qzns3dLlwR5EiUWMWea6xrkEmCMgZK9FGqkjWZCrXgzT/LCrBbBlDSgeF59N8\r\n"  \
"9iFo7+ryUp9/k5DPAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E\r\n"  \
"BTADAQH/MB0GA1UdDgQWBBRge2YaRQ2XyolQL30EzTSo//z9SzANBgkqhkiG9w0B\r\n"  \
"AQUFAAOCAQEA1nPnfE920I2/7LqivjTFKDK1fPxsnCwrvQmeU79rXqoRSLblCKOz\r\n"  \
"yj1hTdNGCbM+w6DjY1Ub8rrvrTnhQ7k4o+YviiY776BQVvnGCv04zcQLcFGUl5gE\r\n"  \
"38NflNUVyRRBnMRddWQVDf9VMOyGj/8N7yy5Y0b2qvzfvGn9LhJIZJrglfCm7ymP\r\n"  \
"AbEVtQwdpf5pLGkkeB6zpxxxYu7KyJesF12KwvhHhm4qxFYxldBniYUr+WymXUad\r\n"  \
"DKqC5JlR3XC321Y9YeRq4VzW9v493kHMB65jUr9TU/Qr6cf9tveCX4XSQRjbgbME\r\n"  \
"HMUfpIBvFSDJ3gyICh3WZlXi/EjJKSZp4A==\r\n"                              \
"-----END CERTIFICATE-----"

const char mbedtls_root_certificate[] = 
	GLOBALSIGN_ROOT_CA
;
#elif 0
////myca for mqtt
#define GLOBALSIGN_ROOT_CA   \
"-----BEGIN CERTIFICATE-----\r\n"  \
"MIID3zCCAsegAwIBAgIJAODxoOUE+Ia8MA0GCSqGSIb3DQEBCwUAMIGFMQswCQYD\r\n"  \
"VQQGEwJDTjEQMA4GA1UECAwHc2hhZ2hhaTERMA8GA1UEBwwIc2hhbmdoYWkxDjAM\r\n"  \
"BgNVBAoMBUJFS0VOMRAwDgYDVQQLDAd3aWZpLWdlMRIwEAYDVQQDDAl3aWZpLXRl\r\n"  \
"YW0xGzAZBgkqhkiG9w0BCQEWDGN3bGluMTYzLmNvbTAeFw0yMDA4MTEwNTQ3Mjha\r\n"  \
"Fw0zMDA4MDkwNTQ3MjhaMIGFMQswCQYDVQQGEwJDTjEQMA4GA1UECAwHc2hhZ2hh\r\n"  \
"aTERMA8GA1UEBwwIc2hhbmdoYWkxDjAMBgNVBAoMBUJFS0VOMRAwDgYDVQQLDAd3\r\n"  \
"aWZpLWdlMRIwEAYDVQQDDAl3aWZpLXRlYW0xGzAZBgkqhkiG9w0BCQEWDGN3bGlu\r\n"  \
"MTYzLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALwa6fM/5xuR\r\n"  \
"nAHQZ+pDDOAK6EJf04yO28G9NGPYP2mQKhkBhcYC9G9xXLglvuCfXFKpsXxMMOYI\r\n"  \
"LjQWL8iN0M6tyt+t7kEbSlBwac0IuqjB62LvK623XvX7k7an/E87oCZih6TYzCy7\r\n"  \
"5HGIELhODa/8sHG5HT8gkqSCJscKbpCocwj13PPs6vwloCmuG0LxB5xb3CkWQ8Kv\r\n"  \
"DCIF2jBTNbnYixlLYZ/P0SQMlHGLcOqTPvWEnowA1VqgNBCDVyln26XM87AV+qQB\r\n"  \
"5dBcLOZmnX0cpg+SFG+wrNUFN4WKI8Pl2suUiD4jeIixAWS2pyOsm8SvrM1YipM0\r\n"  \
"6IdqUQIeCLsCAwEAAaNQME4wHQYDVR0OBBYEFG7AMq4Tgm/sPp9Nl81gL1/YOcrQ\r\n"  \
"MB8GA1UdIwQYMBaAFG7AMq4Tgm/sPp9Nl81gL1/YOcrQMAwGA1UdEwQFMAMBAf8w\r\n"  \
"DQYJKoZIhvcNAQELBQADggEBACPRNVhHXi+8o5hSSX6dBqdUljeAvN2lDYFgVWPr\r\n"  \
"E3teVQADS3kd/60ACLc34ZP+OojlPMz3zbDosH5gRntwFGJUGqkJgQt7xUS2wgyo\r\n"  \
"fuxLNrnz2dIkVfDA/q4GpPVBZwlFKjEc1N6P7ENiJ/DJLkvYi78NDneComid08q2\r\n"  \
"OAbAJjTcUSOYbEygS2FPgFRR2O4s9nrphDgQIzWLgeHIhT7feSyQ7d0emMUv1iEQ\r\n"  \
"LXJU9sbgYU2G02D51tdz+tFObmtGxiy99gEunK6S9AeUnh8xM5eTJW2ebe0CdFmo\r\n"  \
"JkLASY80XmUo6WQVq7iN6mO3zsgIZmwmwSVnTcSPcHARoZ4=\r\n"  \
"-----END CERTIFICATE-----\r\n"

const char mbedtls_root_certificate[] = 
	GLOBALSIGN_ROOT_CA
;
#endif


// mosquitto.org.crt - test.mosquitto.org
// const char mbedtls_root_certificate[] =
//     "-----BEGIN CERTIFICATE-----\r\n"
//     "MIIEAzCCAuugAwIBAgIUBY1hlCGvdj4NhBXkZ/uLUZNILAwwDQYJKoZIhvcNAQEL\r\n"
//     "BQAwgZAxCzAJBgNVBAYTAkdCMRcwFQYDVQQIDA5Vbml0ZWQgS2luZ2RvbTEOMAwG\r\n"
//     "A1UEBwwFRGVyYnkxEjAQBgNVBAoMCU1vc3F1aXR0bzELMAkGA1UECwwCQ0ExFjAU\r\n"
//     "BgNVBAMMDW1vc3F1aXR0by5vcmcxHzAdBgkqhkiG9w0BCQEWEHJvZ2VyQGF0Y2hv\r\n"
//     "by5vcmcwHhcNMjAwNjA5MTEwNjM5WhcNMzAwNjA3MTEwNjM5WjCBkDELMAkGA1UE\r\n"
//     "BhMCR0IxFzAVBgNVBAgMDlVuaXRlZCBLaW5nZG9tMQ4wDAYDVQQHDAVEZXJieTES\r\n"
//     "MBAGA1UECgwJTW9zcXVpdHRvMQswCQYDVQQLDAJDQTEWMBQGA1UEAwwNbW9zcXVp\r\n"
//     "dHRvLm9yZzEfMB0GCSqGSIb3DQEJARYQcm9nZXJAYXRjaG9vLm9yZzCCASIwDQYJ\r\n"
//     "KoZIhvcNAQEBBQADggEPADCCAQoCggEBAME0HKmIzfTOwkKLT3THHe+ObdizamPg\r\n"
//     "UZmD64Tf3zJdNeYGYn4CEXbyP6fy3tWc8S2boW6dzrH8SdFf9uo320GJA9B7U1FW\r\n"
//     "Te3xda/Lm3JFfaHjkWw7jBwcauQZjpGINHapHRlpiCZsquAthOgxW9SgDgYlGzEA\r\n"
//     "s06pkEFiMw+qDfLo/sxFKB6vQlFekMeCymjLCbNwPJyqyhFmPWwio/PDMruBTzPH\r\n"
//     "3cioBnrJWKXc3OjXdLGFJOfj7pP0j/dr2LH72eSvv3PQQFl90CZPFhrCUcRHSSxo\r\n"
//     "E6yjGOdnz7f6PveLIB574kQORwt8ePn0yidrTC1ictikED3nHYhMUOUCAwEAAaNT\r\n"
//     "MFEwHQYDVR0OBBYEFPVV6xBUFPiGKDyo5V3+Hbh4N9YSMB8GA1UdIwQYMBaAFPVV\r\n"
//     "6xBUFPiGKDyo5V3+Hbh4N9YSMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEL\r\n"
//     "BQADggEBAGa9kS21N70ThM6/Hj9D7mbVxKLBjVWe2TPsGfbl3rEDfZ+OKRZ2j6AC\r\n"
//     "6r7jb4TZO3dzF2p6dgbrlU71Y/4K0TdzIjRj3cQ3KSm41JvUQ0hZ/c04iGDg/xWf\r\n"
//     "+pp58nfPAYwuerruPNWmlStWAXf0UTqRtg4hQDWBuUFDJTuWuuBvEXudz74eh/wK\r\n"
//     "sMwfu1HFvjy5Z0iMDU8PUDepjVolOCue9ashlS4EB5IECdSR2TItnAIiIwimx839\r\n"
//     "LdUdRudafMu5T5Xma182OC0/u/xRlEm+tvKGGmfFcN0piqVl8OrSPBgIlb+1IKJE\r\n"
//     "m/XriWr/Cq4h/JfB7NTsezVslgkBaoU=\r\n"                                
//     "-----END CERTIFICATE-----\r\n";

// Let’s Encrypt R3 (Intermediate Certificate) - odm-mqtt-bridge.homny.ru
// const char mbedtls_root_certificate[] =
//     "-----BEGIN CERTIFICATE-----\r\n"
//     "MIIFFjCCAv6gAwIBAgIRAJErCErPDBinU/bWLiWnX1owDQYJKoZIhvcNAQELBQAw\r\n"
//     "TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh\r\n"
//     "cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMjAwOTA0MDAwMDAw\r\n"
//     "WhcNMjUwOTE1MTYwMDAwWjAyMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNTGV0J3Mg\r\n"
//     "RW5jcnlwdDELMAkGA1UEAxMCUjMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK\r\n"
//     "AoIBAQC7AhUozPaglNMPEuyNVZLD+ILxmaZ6QoinXSaqtSu5xUyxr45r+XXIo9cP\r\n"
//     "R5QUVTVXjJ6oojkZ9YI8QqlObvU7wy7bjcCwXPNZOOftz2nwWgsbvsCUJCWH+jdx\r\n"
//     "sxPnHKzhm+/b5DtFUkWWqcFTzjTIUu61ru2P3mBw4qVUq7ZtDpelQDRrK9O8Zutm\r\n"
//     "NHz6a4uPVymZ+DAXXbpyb/uBxa3Shlg9F8fnCbvxK/eG3MHacV3URuPMrSXBiLxg\r\n"
//     "Z3Vms/EY96Jc5lP/Ooi2R6X/ExjqmAl3P51T+c8B5fWmcBcUr2Ok/5mzk53cU6cG\r\n"
//     "/kiFHaFpriV1uxPMUgP17VGhi9sVAgMBAAGjggEIMIIBBDAOBgNVHQ8BAf8EBAMC\r\n"
//     "AYYwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMBMBIGA1UdEwEB/wQIMAYB\r\n"
//     "Af8CAQAwHQYDVR0OBBYEFBQusxe3WFbLrlAJQOYfr52LFMLGMB8GA1UdIwQYMBaA\r\n"
//     "FHm0WeZ7tuXkAXOACIjIGlj26ZtuMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcw\r\n"
//     "AoYWaHR0cDovL3gxLmkubGVuY3Iub3JnLzAnBgNVHR8EIDAeMBygGqAYhhZodHRw\r\n"
//     "Oi8veDEuYy5sZW5jci5vcmcvMCIGA1UdIAQbMBkwCAYGZ4EMAQIBMA0GCysGAQQB\r\n"
//     "gt8TAQEBMA0GCSqGSIb3DQEBCwUAA4ICAQCFyk5HPqP3hUSFvNVneLKYY611TR6W\r\n"
//     "PTNlclQtgaDqw+34IL9fzLdwALduO/ZelN7kIJ+m74uyA+eitRY8kc607TkC53wl\r\n"
//     "ikfmZW4/RvTZ8M6UK+5UzhK8jCdLuMGYL6KvzXGRSgi3yLgjewQtCPkIVz6D2QQz\r\n"
//     "CkcheAmCJ8MqyJu5zlzyZMjAvnnAT45tRAxekrsu94sQ4egdRCnbWSDtY7kh+BIm\r\n"
//     "lJNXoB1lBMEKIq4QDUOXoRgffuDghje1WrG9ML+Hbisq/yFOGwXD9RiX8F6sw6W4\r\n"
//     "avAuvDszue5L3sz85K+EC4Y/wFVDNvZo4TYXao6Z0f+lQKc0t8DQYzk1OXVu8rp2\r\n"
//     "yJMC6alLbBfODALZvYH7n7do1AZls4I9d1P4jnkDrQoxB3UqQ9hVl3LEKQ73xF1O\r\n"
//     "yK5GhDDX8oVfGKF5u+decIsH4YaTw7mP3GFxJSqv3+0lUFJoi5Lc5da149p90Ids\r\n"
//     "hCExroL1+7mryIkXPeFM5TgO9r0rvZaBFOvV2z0gp35Z0+L4WPlbuEjN/lxPFin+\r\n"
//     "HlUjr8gRsI3qfJOQFy/9rKIJR0Y/8Omwt/8oTWgy1mdeHmmjk7j1nYsvC9JSQ6Zv\r\n"
//     "MldlTTKB3zhThV1+XWYp6rjd5JW1zbVWEkLNxE7GJThEUG3szgBVGP7pSWTUTsqX\r\n"
//     "nLRbwHOoq7hHwg==\r\n"
//     "-----END CERTIFICATE-----\r\n";

// ISRG Root X1 (Root Certificate) - odm-mqtt-bridge.homny.ru
const char mbedtls_root_certificate[] =
    "-----BEGIN CERTIFICATE-----\r\n"
    "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\r\n"
    "-----END CERTIFICATE-----\r\n";

const size_t mbedtls_root_certificate_len = sizeof(mbedtls_root_certificate);

#if 0
///client client.crt
#define GLOBALSIGN_Client_crt   \
"-----BEGIN CERTIFICATE-----\r\n"  \
"MIIDkDCCAngCCQCb4RI7B1uRIDANBgkqhkiG9w0BAQsFADCBhTELMAkGA1UEBhMC\r\n"  \
"Q04xEDAOBgNVBAgMB3NoYWdoYWkxETAPBgNVBAcMCHNoYW5naGFpMQ4wDAYDVQQK\r\n"  \
"DAVCRUtFTjEQMA4GA1UECwwHd2lmaS1nZTESMBAGA1UEAwwJd2lmaS10ZWFtMRsw\r\n"  \
"GQYJKoZIhvcNAQkBFgxjd2xpbjE2My5jb20wHhcNMjAwODExMDU1MzI1WhcNMzAw\r\n"  \
"ODA5MDU1MzI1WjCBjTELMAkGA1UEBhMCQ04xETAPBgNVBAgMCHNoYW5naGFpMREw\r\n"  \
"DwYDVQQHDAhzaGFuZ2hhaTEOMAwGA1UECgwFYmVrZW4xEzARBgNVBAsMCmJla2Vu\r\n"  \
"LXdpZmkxFjAUBgNVBAMMDTE5Mi4xNjguMTkuMjQxGzAZBgkqhkiG9w0BCQEWDGN3\r\n"  \
"bGluMTYzLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMSKa+Cn\r\n"  \
"9wVL7H1/zY02jJTHmq3Y6XfMwwkHsCE3Oag62snjNs60LQCYIQvGMXRmz9hIuWRW\r\n"  \
"hAA627TLIAvGhXG5mFkuG3HJJLQLdTGuWobjTL74/hrSAstmJM/eg9M1FHvWO9rq\r\n"  \
"bTNagybd9k2BjdZdah1QFlDagECtAbBKq89riKqvlwaIJP43Xb0dYXZ223iHsNDv\r\n"  \
"wYO9TU9Cl7U49UURUA7hw649cPtVA++uKQJSsqEpHF1/Q0fJcCnFqfPSZsqdhBmO\r\n"  \
"p4S1t+xqpautEiGWyBcdOZ1Og4a5gio4hBt4hDpLWXIF/mrjGMvImm4RlOkAhbil\r\n"  \
"6nZz+ZwXl2RD4ZkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAkY7PGZkxn4zoV+/a\r\n"  \
"EBcZ06V9PqCYtn+8/r4ciBW1GHjveOXX5plVkaKpkx1QFOS5RV96vk4N10HnKO9V\r\n"  \
"YjRqPN3maiQ+bn3Yve0zopMPbNiA+oTZqrP8jRlpTujCo7XE6fKXfQYpRXijXDHB\r\n"  \
"Ty4pURq8UkEmyZyFoSUYgib2aG0K656OOG5LSRRda4NSWJilhLB5Aheb7gfVcLut\r\n"  \
"eUq28qFSx0BC+Yf2IaMMnOIO1HD8mgdEgktGlX7eapAive3g/sFmaX9TPzV6hJ5U\r\n"  \
"s4OvpG2D3BzwJH5pmoi1ovOi2m0WauR8Z3W3m7kywLEUtfEbX0W+Q02CPMYw1jmi\r\n"  \
"D/qgUw==\r\n"  \
"-----END CERTIFICATE-----\r\n"


const char mbedtls_client_certificate[] =
	GLOBALSIGN_ROOT_CA
	GLOBALSIGN_Client_crt
;
const size_t mbedtls_client_certificate_len = sizeof(mbedtls_client_certificate);
#endif



