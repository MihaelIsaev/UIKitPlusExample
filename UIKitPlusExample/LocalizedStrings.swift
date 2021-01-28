import UIKitPlus

extension String {
    static func transferTo(_ wallet: String) -> String {
        .init(
            .en("Transfer to #\(wallet)"),
            .ru("Перевод на #\(wallet)"),
            .zh("转移到 #\(wallet)"),
            .ja("＃\(wallet)に転送"),
            .es("Transferir a #\(wallet)"),
            .fr("Transférer au #\(wallet)"),
            .sv("Överför till #\(wallet)"),
            .de("Übertragen Sie auf #\(wallet)"),
            .tr("\(wallet) numarasına aktar"),
            .it("Trasferimento al n. \(wallet)"),
            .cs("Převod na #\(wallet)"),
            .he("\(wallet) העבר למספר"),
            .ar("\(wallet)#نقل إلى")
        )
    }
    fileprivate static var copyLink: String {
        .init(
            .en("Copy link to clipboard"),
            .ru("Скопировать ссылку"),
            .zh("复制链接到剪贴板"),
            .ja("リンクをクリップボードにコピー"),
            .es("Copiar enlace al portapapeles"),
            .fr("Copier le lien dans le presse-papiers"),
            .sv("Kopiera länk till urklipp"),
            .de("Link in Zwischenablage kopieren"),
            .tr("Bağlantıyı panoya kopyala"),
            .it("Copia il link negli appunti"),
            .cs("Zkopírujte odkaz do schránky"),
            .he("העתק קישור ללוח"),
            .ar("نسخ الرابط إلى الحافظة")
        )
    }
    static var copyLinkSucceeded: String {
        .init(
            .en("Link has been copied to clipboard"),
            .ru("Ссылка успешно скопирована в буфер обмена"),
            .zh("链接已复制到剪贴板"),
            .ja("リンクがクリップボードにコピーされました"),
            .es("El enlace ha sido copiado al portapapeles"),
            .fr("Le lien a été copié dans le presse-papiers"),
            .sv("Länken har kopierats till Urklipp"),
            .de("Der Link wurde in die Zwischenablage kopiert"),
            .tr("Bağlantı panoya kopyalandı"),
            .it("Il link è stato copiato negli appunti"),
            .cs("Odkaz byl zkopírován do schránky"),
            .he("הקישור הועתק ללוח"),
            .ar("تم نسخ الرابط إلى الحافظة")
        )
    }
    static var shareNumber: String {
        .init(
            .en("Share number"),
            .ru("Поделиться номером"),
            .zh("分享号码"),
            .ja("共有番号"),
            .es("Compartir número"),
            .fr("Numéro de partage"),
            .sv("Aktienummer"),
            .de("Teilenummer"),
            .tr("Numarayı paylaş"),
            .it("Condividi il numero"),
            .cs("Sdílejte číslo"),
            .he("מספר שתף"),
            .ar("رقم السهم")
        )
    }
    static var shareLink: String {
        .init(
            .en("Share link"),
            .ru("Поделиться ссылкой"),
            .zh("分享链接"),
            .ja("共有リンク"),
            .es("Compartir enlace"),
            .fr("Lien de partage"),
            .sv("Dela länk"),
            .de("Einen Link teilen"),
            .tr("Linki paylaş"),
            .it("Condividi il link"),
            .cs("Sdílet odkaz"),
            .he("שתף קישור"),
            .ar("مشاركة الرابط")
        )
    }
}
