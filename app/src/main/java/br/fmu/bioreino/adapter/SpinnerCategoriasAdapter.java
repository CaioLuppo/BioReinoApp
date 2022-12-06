package br.fmu.bioreino.adapter;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.util.ListaUtil;

public class SpinnerCategoriasAdapter extends BaseAdapter {

    private final String[] planos;

    public SpinnerCategoriasAdapter(String[] planos) {
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
        View layout = ListaUtil.inflaLayout(viewGroup, R.layout.item_plano_categoria);

        TextView label = layout.findViewById(R.id.item_plano_categoria_label);
        label.setText(planos[i]);

        return layout;
    }

}
