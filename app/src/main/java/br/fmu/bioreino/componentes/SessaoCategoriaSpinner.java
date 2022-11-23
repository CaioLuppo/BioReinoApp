package br.fmu.bioreino.componentes;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.widget.Spinner;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.widget.AppCompatSpinner;

public class SessaoCategoriaSpinner extends AppCompatSpinner {

    public interface SpinnerListener {
        void aberturaPopUp(Spinner spinner);
        void fechamentoPopUp(Spinner spinner);
    }

    private SpinnerListener spinnerListener;
    private boolean aberto = false;

    public void setSpinnerListener(SpinnerListener listener) {
        spinnerListener = listener;
    }

    public SessaoCategoriaSpinner(@NonNull Context context) {
        super(context);
    }

    public SessaoCategoriaSpinner(@NonNull Context context, int mode) {
        super(context, mode);
    }

    public SessaoCategoriaSpinner(@NonNull Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public SessaoCategoriaSpinner(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public SessaoCategoriaSpinner(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr, int mode) {
        super(context, attrs, defStyleAttr, mode);
    }

    public SessaoCategoriaSpinner(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr, int mode, Resources.Theme popupTheme) {
        super(context, attrs, defStyleAttr, mode, popupTheme);
    }

    @Override
    public boolean performClick() {

        aberto = true;
        if (spinnerListener != null) {
            spinnerListener.aberturaPopUp(this);
        }

        return super.performClick();
    }

    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {

        if (aberto && hasWindowFocus){
            aberto = false;
            if (spinnerListener != null) {
                spinnerListener.fechamentoPopUp(this);
            }
        }

        super.onWindowFocusChanged(hasWindowFocus);
    }

}
