// LazyShopDRM hashing algorithm for FFI export

#[ffi_export]
fn hash_alg(arg: char_p::Ref<'_>) -> char_p::Box {
    let arg = arg.to_str().as_bytes();
    let check_string: [u8; 24] = *b"QBCHEKCCHEQBCHERTYITACHE";
    let mut string = String::new();

    for (i, symbol) in String::from_utf8(arg.to_vec()).unwrap().chars().enumerate() {
        let new_char = (check_string[i % check_string.len()] as u32 ^ symbol as u32) as u8;
        string.push(new_char as char);
    }

    let data = string.as_bytes();
    let base64_string = DefaultBase64Engine.encode(data);

    format!("{}", base64_string) // -------+
        .try_into() //                   |
        .unwrap() // <
}
