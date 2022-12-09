package br.fmu.bioreino.util;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;

import br.fmu.bioreino.R;

public class ListaUtil {

    public static View inflaLayout(@NonNull ViewGroup parent, int layout) {
        return LayoutInflater.from(parent.getContext()).inflate(layout, parent, false);
    }

    public static View mensagemVazia(String mensagem, Context context, ViewGroup viewGroup) {
        View view = LayoutInflater.from(context).inflate(R.layout.layout_lista_vazia, viewGroup, false);
        TextView mensagemView = view.findViewById(R.id.layout_lista_vazia_mensagem);
        mensagemView.setText(mensagem);
        return view;
    }

    public static int formataProgressoBarra(int progresso) {
        if (progresso == 0 || progresso > 10) {
            return progresso;
        }
        return 10;
    }

}
