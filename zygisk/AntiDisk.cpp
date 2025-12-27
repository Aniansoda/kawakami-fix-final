#include <unistd.h>
#include <sys/system_properties.h>
#include <ctime>
#include <fstream>
#include "Utils.h"

static void write_json_log(const char* msg) {
    std::ofstream f("/data/adb/kawakami_fix_events.json", std::ios::app);
    if (!f.is_open()) return;
    time_t t = time(nullptr);
    f << "{\"time\":" << t
      << ",\"pid\":" << getpid()
      << ",\"uid\":" << getuid()
      << ",\"event\":\"" << msg << "\"}\n";
}

extern "C" __attribute__((constructor))
void kawakami_zygisk_entry() {
    char sdk[PROP_VALUE_MAX] = {0};
    __system_property_get("ro.build.version.sdk", sdk);
    int api = atoi(sdk);
    if (api <= 35) write_json_log("android_le_15_monitor");
    else write_json_log("android_ge_16");
}
