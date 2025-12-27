#!/system/bin/sh
BASE=/data/adb/modules/kawakami_fix
LOG=$BASE/security/tamper.log
fail() {
  echo "[TAMPER] $(date)" >> $LOG
  touch $BASE/disable
  exit 0
}
while read -r f; do
  [ -f "$BASE/$f" ] || fail
done < $BASE/security/hash.list
