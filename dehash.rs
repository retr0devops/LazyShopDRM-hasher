// LazyShopDRM dehash algorithm for FFI export

#[ffi_export]
fn dehash_alg(arg: char_p::Ref<'_>) -> char_p::Box {
    let arg = arg.to_str().as_bytes();
    let check_string: [u8; 24] = *b"QBCHEKCCHEQBCHERTYITACHE";
    let base64_data = DefaultBase64Engine.decode(String::from_utf8(arg.to_vec()).unwrap()).unwrap_or_default();
    let decrypted_data: Vec<u8> = base64_data
        .iter()
        .enumerate()
        .map(|(i, &byte)| byte ^ check_string[i % check_string.len()])
        .collect();

    let decrypted_string = String::from_utf8(decrypted_data).unwrap_or_default();
    format!("{}", decrypted_string)
        .try_into()
        .unwrap()
}
