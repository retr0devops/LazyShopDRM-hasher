# LazyShop-Hasher

## Beginning

This algorithm was implemented based on the analysis of the LazyShop DRM machine code. 

It is used to write the base64 reference value to NSUserDefaults. (key __LS_CHECK). As it seemed earlier, it could be a private/public key encryption algorithm. However, in practice, this is a common hashing algorithm. 

This algorithm also takes an active part in sending a hashed message to the custom OSCP LazyShop server.

## Hashing algorithm

### Example
Input normal string:
```
BC57636C-F717-4893-A110-41617854B24_com.zhiliaoapp.musically
```

Output base64 string:
```
EwF2f3N4dQBlA2ZzdGVxam1qZBVwcnhoZXN1eXJzdnd6B2N2HCsqP3ojIT0tKikqMDIzZig+MCorJD0uOg==
```

## Dehashing algorithm

### Example

Input base64 string:
```
EwF2f3N4dQBlA2ZzdGVxam1qZBVwcnhoZXN1eXJzdnd6B2N2HCsqP3ojIT0tKikqMDIzZig+MCorJD0uOg==
```

Output normal string:
```
BC57636C-F717-4893-A110-41617854B24_com.zhiliaoapp.musically
```

First part: UUID (for vendor)
Second part: Application Bundle ID
