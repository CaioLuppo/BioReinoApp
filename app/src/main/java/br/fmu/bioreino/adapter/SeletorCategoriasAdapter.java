package br.fmu.bioreino.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import br.fmu.bioreino.R;

public class SeletorCategoriasAdapter extends BaseAdapter {

    private final Context contexto;
    private final String[] planos;

    public SeletorCategoriasAdapter(Context contexto, String[] planos) {
        this.contexto = contexto;
        this.planos = planos;
    }

    @Override
    public int getCount() {
        return planos != null ? planos.length : 0;
    }

    @Override
    public Object getItem(int i) {
        return null;
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        View layout = pegaLayout(viewGroup);

        TextView label = layout.findViewById(R.id.item_plano_categoria_label);
        label.setText(planos[i]);

        return layout;
    }

    private View pegaLayout(ViewGroup viewGroup) {
        return LayoutInflater.from(contexto).inflate(R.layout.item_plano_categoria, viewGroup, false);
    }
}
