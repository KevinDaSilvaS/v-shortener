module structs

pub struct ResponseObject<T> {
    pub: code int
         body T
         format FileFormats
}