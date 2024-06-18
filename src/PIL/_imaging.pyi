from typing import Any

class ImagingCore:
    def __getattr__(self, name: str) -> Any: ...

class ImagingFont:
    def __getattr__(self, name: str) -> Any: ...

class ImagingDraw:
    def __getattr__(self, name: str) -> Any: ...

class PixelAccess:
    def __getattr__(self, name: str) -> Any: ...

class ImagingDecoder:
    def __getattr__(self, name: str) -> Any: ...

class ImagingEncoder:
    def __getattr__(self, name: str) -> Any: ...

def font(image: ImagingCore, glyphdata: bytes) -> ImagingFont: ...
def __getattr__(name: str) -> Any: ...
