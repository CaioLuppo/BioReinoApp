package br.fmu.bioreino.util;

import android.graphics.drawable.Drawable;

import java.io.InputStream;
import java.net.URL;

public interface ImagemWeb {

    /// Pega uma imagem da internet
    static Drawable getImagem(String linkImagem) {
        try {
            URL url = new URL(linkImagem);
            InputStream stream = (InputStream) url.getContent();
            return Drawable.createFromStream(stream, "imagemWeb");
        } catch (Exception e) {
            return null;
        }
    }

}
